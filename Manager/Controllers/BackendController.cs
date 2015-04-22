using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace Manager.Controllers
{
    public class BackendController : Controller
    {
        
        DataClasses1DataContext db = new DataClasses1DataContext();

        public class JsonEvent
        {
            public string id { get; set; }
            public string text { get; set; }
            public string start { get; set; }
            public string end { get; set; }
        }

        public ActionResult Events(DateTime? start, DateTime? end)
        {

            // SQL: SELECT * FROM [event] WHERE NOT (([end] <= @start) OR ([start] >= @end))
            var events = from ev in db.Reservations.AsEnumerable()
                         join cust in db.Customers on ev.userid equals cust.userid
                         join tempcust in db.tempCustomers on ev.tempid equals tempcust.tempid
                         join serv in db.Services on ev.serviceid equals serv.serviceid
                         join stylist in db.StylistProfileInfoes on ev.stylistid equals stylist.Id
                         where !(ev.resEnd <= start || ev.resStart >= end)
                         select new
                         {
                             res_id = ev.reser_id,
                             starttime = ev.resStart,
                             endtime = ev.resEnd,
                             details =  ((tempcust.tempid == 1) ? cust.firstname + ' ' + cust.lastname
                             + "\n" + serv.servicetitle
                             + " Stylist: " + stylist.FirstName + " " + stylist.LastName : tempcust.firstname + ' ' + tempcust.lastname + "\n" + serv.servicetitle).ToString()
                         };

            var result = events
            .Select(e => new JsonEvent() { 
                start = e.starttime.ToString("s"),
                end = e.endtime.ToString("s"),
                text = e.details,
                id = e.res_id.ToString()
            })
            .ToList();

            return new JsonResult { Data = result };
        }

        public ActionResult Create(string start, string end, string name)
        {
            string[] words = name.Split('/');
            var toBeCreated = new Reservation { 
                resStart = Convert.ToDateTime(start), 
                resEnd = Convert.ToDateTime(end), 
                //userid = userid,
                serviceid = Convert.ToInt32(words[0]),
                stylistid = Convert.ToInt32(words[1]),
                tempid = Convert.ToInt32(words[2]),
                userid = Convert.ToInt32(words[3])
            };
            db.Reservations.InsertOnSubmit(toBeCreated);
            db.SubmitChanges();

            return new JsonResult { Data = new Dictionary<string, object> { { "id", toBeCreated.reser_id } } };

        }

        public ActionResult Move(int id, string newStart, string newEnd)
        {
            var toBeResized = (from ev in db.Reservations where ev.reser_id == id select ev).First();
            toBeResized.resStart = Convert.ToDateTime(newStart);
            toBeResized.resEnd = Convert.ToDateTime(newEnd);
            db.SubmitChanges();

            return new JsonResult { Data = new Dictionary<string, object> { { "id", toBeResized.reser_id } } };
        }

        public ActionResult Resize(int id, string newStart, string newEnd)
        {
            var toBeResized = (from ev in db.Reservations where ev.reser_id == id select ev).First();
            toBeResized.resStart = Convert.ToDateTime(newStart);
            toBeResized.resEnd = Convert.ToDateTime(newEnd);
            db.SubmitChanges();

            return new JsonResult { Data = new Dictionary<string, object> { { "id", toBeResized.reser_id } } };
        }

    }
}