using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace TresPuntoCinco.Data
{
	public class UpdateHelper
	{
		private const string UpdateText = "UPDATE {0} SET {1} WHERE {2}";

       /* public static string GetUpdateWithoutPrimaryKey(Type objectToUpdate)
		{
			// Type typeObjectInsert = objectToUpdate.GetType();

            return string.Format(UpdateText, objectToUpdate.Name, GetNonPrimaryKeyColumnsFromObject(objectToUpdate, "@"), GetPrimaryKeyColumnsFromObject(objectToUpdate, "@"));
		}*/

        public static string GetUpdateAllColumns(dynamic objectToUpdate)
		{
			Type typeObjectUpdate = objectToUpdate.GetType();
            //return string.Format(UpdateText, typeObjectUpdate.Name, GetUpdateWithoutPrimaryKey(typeObjectUpdate), GetPrimaryKeyColumnsFromObject(objectToUpdate, "@"));
            return string.Format(UpdateText, typeObjectUpdate.Name, GetNonPrimaryKeyColumnsFromObject(typeObjectUpdate, "@"), GetPrimaryKeyColumnsFromObject(typeObjectUpdate, "@"));
		}

		/*private static string GetAllColumnsFromObject(Type objectToGetColumns)
		{
			return GetAllColumnsFromObject(objectToGetColumns, string.Empty);
		}

		private static string GetAllColumnsFromObject(Type objectToGetColumns, string parameterPrefix)
		{
			IList<PropertyInfo> properties = new List<PropertyInfo>(objectToGetColumns.GetProperties());
			var columnsToInsert = string.Empty;
            columnsToInsert = properties.Aggregate(columnsToInsert, (current, property) => current + (property.Name + " = " + parameterPrefix + property.Name + ", "));

			return columnsToInsert.Substring(0, columnsToInsert.Length - 2);
		}*/

		private static string GetNonPrimaryKeyColumnsFromObject(Type objectToGetColumns)
		{
			return GetNonPrimaryKeyColumnsFromObject(objectToGetColumns, string.Empty);
		}

		private static string GetNonPrimaryKeyColumnsFromObject(Type objectToGetColumns, string parameterPrefix)
		{
			IList<PropertyInfo> properties = new List<PropertyInfo>(objectToGetColumns.GetProperties());
			var columnsToInsert = string.Empty;

			columnsToInsert = properties.Where(property => property.Name.ToUpper() != "ID" + objectToGetColumns.Name.ToUpper())
                                        .Aggregate(columnsToInsert, (current, property) => current + (property.Name + " = " + parameterPrefix + property.Name + ", "));
			
			return columnsToInsert.Substring(0, columnsToInsert.Length - 2);
		}

        private static string GetPrimaryKeyColumnsFromObject(Type objectToGetColumns, string parameterPrefix)
        {
            IList<PropertyInfo> properties = new List<PropertyInfo>(objectToGetColumns.GetProperties());
            var columnsToInsert = string.Empty;

            columnsToInsert = properties.Where(property => property.Name.ToUpper() == "ID" + objectToGetColumns.Name.ToUpper())
                                        .Aggregate(columnsToInsert, (current, property) => current + (property.Name + " = " + parameterPrefix + property.Name + ", "));

            return columnsToInsert.Substring(0, columnsToInsert.Length - 2);
        }
	}
}
