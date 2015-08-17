using System.Collections.Generic;
using System.Data;
using TresPuntoCinco.Model;
using TresPuntoCinco.Data;
using System;

namespace TresPuntoCinco.DataAccess
{
    public class PlanificacionDataAccess
    {
        public List<Planificacion> ObtenerPlanificacion(DateTime fechaInicio)
        {
            return DbHelper.SelectObject<Planificacion>();
        }

        public List<Planificacion> ObtenerListaPlanificacion(DateTime fechaInicio, DateTime fechaFin)
        {
            return DbHelper.ExecuteProcedure<Planificacion>("ObtenerPlanificacion",
                new {FechaInicio = fechaInicio, FechaFin = fechaFin});
            /*var user = cnn.Query<Planificacion>("ObtenerPlanificacion", new {Id = 1}, 
        commandType: CommandType.StoredProcedure).First();}}}*/
        }

        public Planificacion ObtenerPlanificacionPorId(int idPlanificacion)
        {
            return DbHelper.SelectObjectById<Planificacion>(new { IdPlanificacion = idPlanificacion });
        }


        public List<ViewModelPlan> ObtenerPlanificacionTable(DateTime fechaInicio)
        {
            return DbHelper.ExecuteProcedure<ViewModelPlan>("ObtenerPlanificacionPorSemana", 
                        new { FechaInicio = fechaInicio });
        }
    }
}
