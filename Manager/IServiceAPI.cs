using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace Manager
{
    public interface IServiceAPI
    {
        void CreateNewAccount(string firstName, string lastName, string userName, string password);
        DataTable GetUserDetails(string userName);
        bool UserAuthentication(string userName, string passsword);
        DataTable GetDepartmentDetails();
    }
}