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

        public static DataTable GetServices()
        {
            DataTable result = new DataTable();
            Conn = getConnection();
            using (SqlCommand command = Conn.CreateCommand())
            {
                command.CommandTimeout = 0;
                command.CommandType = CommandType.StoredProcedure;

                command.CommandText = "get_services_sp";         //"get_services_sp" is stored proc
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

        public static DataTable GetStylists()
        {
            DataTable result = new DataTable();
            Conn = getConnection();
            using (SqlCommand command = Conn.CreateCommand())
            {
                command.CommandTimeout = 0;
                command.CommandType = CommandType.StoredProcedure;

                command.CommandText = "get_stylists_sp";         //"get_services_sp" is stored proc
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
        public static DataTable GetCustomers()
        {
            DataTable result = new DataTable();
            Conn = getConnection();
            using (SqlCommand command = Conn.CreateCommand())
            {
                command.CommandTimeout = 0;
                command.CommandType = CommandType.StoredProcedure;

                command.CommandText = "get_customers_sp";         //"get_services_sp" is stored proc
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

        public static void InsertTempCustomers(string firstname, string lastname, string phonenumber)
        {
            DataTable result = new DataTable();
            Conn = getConnection();
            using (SqlCommand command = Conn.CreateCommand())
            {
                command.CommandTimeout = 0;
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddRange(new SqlParameter[] {        //params for stored proc
                        new SqlParameter("@fname", firstname),
                        new SqlParameter("@lname", lastname),
                        new SqlParameter("@phonenumber", phonenumber)
                    });
                command.CommandText = "insert_TempCustomer_sp";         //"get_services_sp" is stored proc
                
                command.Connection.Close();
                }
        }

        public static string GetTempID(string firstname, string lastname)
        {
            //DataSet result = new DataSet();
            string variable = null;
            Conn = getConnection();
            using (SqlCommand command = Conn.CreateCommand())
            {
                command.CommandTimeout = 0;
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddRange(new SqlParameter[] {        //params for stored proc
                        new SqlParameter("@fname", firstname),
                        new SqlParameter("@lname", lastname)
                    });

                command.CommandText = "GetTempCustomer_sp";         //"get_services_sp" is stored proc
                command.Connection.Open();

                using(var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                        variable = reader.GetString(reader.GetOrdinal("tempid"));
                }
                /*using (SqlDataAdapter adapter = new SqlDataAdapter())
                {
                    adapter.SelectCommand = command;

                    if (command.Connection.State != ConnectionState.Open)
                        command.Connection.Open();

                    adapter.Fill(result);

                    
                }*/
                command.Connection.Close();
            }
            return variable;
        }

        public EZSnipsAccess()
        {
 
        }
 
    }
}