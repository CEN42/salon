using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;


namespace Manager
{
    public class EZSnipsAccess
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        static SqlConnection Conn;
 
        public static SqlConnection getConnection()
        {
            Conn = new SqlConnection(connectionString);
            return Conn;
 
        }

        public static DataSet GetReservations(DateTime startDate, DateTime endDate)
        {
            DataSet result = new DataSet();
            Conn = getConnection();
            using (SqlCommand command = Conn.CreateCommand())
            {
                command.CommandTimeout = 0;
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddRange(new SqlParameter[] {        //params for stored proc
                        new SqlParameter("@startDate", startDate),
                        new SqlParameter("@endDate", endDate)
                    });
                command.CommandText = "mngr_GetReservations_sp";         //"ManagerGetReservations" is stored proc
                using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = command;

                    if (command.Connection.State != ConnectionState.Open)
                        command.Connection.Open();

                    adapter.Fill(result);

                    command.Connection.Close();
                }
            }
            return result;
        }
        public EZSnipsAccess()
        {
 
        }
 
    }
}