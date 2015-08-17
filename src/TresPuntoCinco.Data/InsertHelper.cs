using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace TresPuntoCinco.Data
{
	public class InsertHelper
	{
		private const string InsertText = "INSERT INTO {0} ({1}) VALUES ({2})";

		public static string GetInsertWithoutPrimaryKey(dynamic objectToInsert)
		{
			Type typeObjectInsert = objectToInsert.GetType();

			return string.Format(InsertText, typeObjectInsert.Name, GetNonPrimaryKeyColumnsFromObject(typeObjectInsert), GetNonPrimaryKeyColumnsFromObject(typeObjectInsert, "@"));
		}

		public static string GetInsertAllColumns(dynamic objectToInsert)
		{
			Type typeObjectInsert = objectToInsert.GetType();

			return string.Format(InsertText, typeObjectInsert.Name, GetAllColumnsFromObject(typeObjectInsert), GetAllColumnsFromObject(typeObjectInsert, "@"));
		}

		private static string GetAllColumnsFromObject(Type objectToGetColumns)
		{
			return GetAllColumnsFromObject(objectToGetColumns, string.Empty);
		}

		private static string GetAllColumnsFromObject(Type objectToGetColumns, string parameterPrefix)
		{
			IList<PropertyInfo> properties = new List<PropertyInfo>(objectToGetColumns.GetProperties());
			var columnsToInsert = string.Empty;
			columnsToInsert = properties.Aggregate(columnsToInsert, (current, property) => current + (parameterPrefix + property.Name + ", "));

			return columnsToInsert.Substring(0, columnsToInsert.Length - 2);
		}

		private static string GetNonPrimaryKeyColumnsFromObject(Type objectToGetColumns)
		{
			return GetNonPrimaryKeyColumnsFromObject(objectToGetColumns, string.Empty);
		}

		private static string GetNonPrimaryKeyColumnsFromObject(Type objectToGetColumns, string parameterPrefix)
		{
			IList<PropertyInfo> properties = new List<PropertyInfo>(objectToGetColumns.GetProperties());
			var columnsToInsert = string.Empty;

			columnsToInsert = properties.Where(property => property.Name.ToUpper() != "ID" + objectToGetColumns.Name.ToUpper())
										.Aggregate(columnsToInsert, (current, property) => current + (parameterPrefix + property.Name + ", "));
			
			return columnsToInsert.Substring(0, columnsToInsert.Length - 2);
		}
	}
}
