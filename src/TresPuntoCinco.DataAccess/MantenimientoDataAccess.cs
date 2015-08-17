using System;
using System.Collections.Generic;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;

namespace TresPuntoCinco.DataAccess
{
    public class MantenimientoDataAccess
    {
        public List<Mantenimiento> ObtenerMantenimientos(DateTime fechaInicio, DateTime fechaFin)
        {
            // return DbHelper.SelectObject<Mantenimiento>();
            return DbHelper.ExecuteProcedure<Mantenimiento>("ObtenerMantenimientos",
                        new {FechaInicio = fechaInicio, FechaFin = fechaFin});
        }

        public List<Mantenimiento> ObtenerMantenimientosFuturos(DateTime fechaInicial)
        {
            return DbHelper.SelectObjectWithWhere<Mantenimiento>(new { FechaInicio = fechaInicial });
        }

        public Mantenimiento ObtenerMentenimientosPorIdentificacion(int idUnidad)
		{
            return DbHelper.SelectObjectById<Mantenimiento>(new { IdUnidad = idUnidad });
		}
	}
}
