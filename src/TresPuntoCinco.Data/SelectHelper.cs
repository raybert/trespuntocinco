using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace TresPuntoCinco.Data
{
    public static class SelectHelper
    {
        private const string SelectText = "SELECT {0} FROM {1} WHERE {2}";
        private const string SelectTextWithoutFilter = "SELECT {0} FROM {1}";

	    public static string SelectAllColumnsFromObject(Type objectToSelect, dynamic whereObject)
	    {
		    return string.Format(SelectText, GetAllColumnsFromObject(objectToSelect), objectToSelect.Name, GetWhere(whereObject.GetType(), "@"));
	    }

        public static string SelectAllColumnsFromObject(Type objectToSelect)
        {
            return string.Format(SelectTextWithoutFilter, GetAllColumnsFromObject(objectToSelect), objectToSelect.Name);
        }

        private static string GetAllColumnsFromObject(Type objectToGetColumns)
        {
            return GetAllColumnsFromObject(objectToGetColumns, string.Empty);
        }

        private static string GetAllColumnsFromObject(Type objectToGetColumns, string parameterPrefix)
        {
            var properties = new List<PropertyInfo>(objectToGetColumns.GetProperties());
            var columnsToFilter = string.Empty;
            columnsToFilter = properties.Aggregate(columnsToFilter, (current, property) => current + (parameterPrefix + property.Name + ", "));

            return columnsToFilter.Substring(0, columnsToFilter.Length - 2);
        }

        private static string GetWhere(Type objectToGetColumns, string parameterPrefix)
        {
            var properties = new List<PropertyInfo>(objectToGetColumns.GetProperties());
            var columnsToFilter = string.Empty;
            columnsToFilter = properties.Aggregate(columnsToFilter, (current, property) => current + (string.Format("{0} = {1}{0} AND ", property.Name, parameterPrefix)));

            return columnsToFilter.Substring(0, columnsToFilter.Length - 5);
        }

    }
}