using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using Dapper;

namespace TresPuntoCinco.Data
{
    public static class DbHelper
    {
        private static readonly string ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        public static int Insert(dynamic objectToInsert)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                return SqlMapper.Execute(connection, InsertHelper.GetInsertWithoutPrimaryKey(objectToInsert), objectToInsert);
            }
        }

        public static int Update(dynamic objectToInsert)
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                return SqlMapper.Execute(connection, UpdateHelper.GetUpdateAllColumns(objectToInsert), objectToInsert);
            }
        }

        public static List<T> SelectObject<T>()
        {
            var tipoDato = typeof(T);
            List<T> resultList;

            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                resultList = connection.Query<T>(SelectHelper.SelectAllColumnsFromObject(tipoDato)).ToList();
            }
            return resultList;
        }

        public static List<T> SelectObject<T>(dynamic selectParameters)
        {
            var tipoDato = typeof(T);
            List<T> resultList;

            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                //resultList = SqlMapper.Query<T>(connection, string.Format(SelectText, GetAllColumnsFromObject(tipoDato), tipoDato.Name, GetWhere(selectParameters.GetType(), "@")), selectParameters);
                resultList = SqlMapper.Query<T>(connection, SelectHelper.SelectAllColumnsFromObject(tipoDato, selectParameters), selectParameters);
            }
            return resultList;
        }

        public static List<T> SelectObjectWithQuery<T>(string query)
        {
            List<T> resultList;

            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                resultList = connection.Query<T>(query).ToList();
            }
            return resultList;
        }

        public static T SelectObjectById<T>(dynamic whereById)
        {
            var tipoDato = typeof(T);
            T resultObject;

            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                List<T> result = SqlMapper.Query<T>(connection, SelectHelper.SelectAllColumnsFromObject(tipoDato, whereById), whereById);
                resultObject = result.Count > 0 ? result.First() : default(T);
            }
            return resultObject;
        }

        public static List<T> SelectObjectWithWhere<T>(dynamic whereById)
        {
            var tipoDato = typeof(T);
            List<T> resultList;

            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                resultList = SqlMapper.Query<T>(connection, SelectHelper.SelectAllColumnsFromObject(tipoDato, whereById), whereById);
            }
            return resultList;
        }

        public static List<T> ExecuteProcedure<T>(string procedureName, dynamic procedureParameters)
        {
            List<T> resultList;

            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                resultList = SqlMapper.Query<T>(connection, procedureName, procedureParameters, commandType: CommandType.StoredProcedure);
            }
            return resultList;
        }
    }
}
