using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;
using TresPuntoCinco.DataAccess;

namespace TresPuntoCinco.Business
{
	public class PlanificacionBussines
	{
        public List<ViewModelPlan> ObtenerPlanificacion(DateTime fechaInicio)
		{
            var planificacionData = new PlanificacionDataAccess();
            return planificacionData.ObtenerPlanificacionTable(fechaInicio);
            //var planificacionData = new PlanificacionDataAccess();
            ////var listaPlanificacion = planificacionData.ObtenerPlanificacion(fechaInicio);
            ////var listaPlanificacion = planificacionData.ObtenerListaPlanificacion(fechaInicio, fechaFin);
            /*var planificacion = from p in listaPlanificacion
                                select new PlanificacionViewModel{ NombreDia = p.Fecha}*/

            ////listaPlanificacion.Add(new DetallePlanificacionViewModel{ planificacionData.ObtenerPlanificacion);
            //var listaPlanificacion = new List<PlanificacionViewModel>();
            //var planificacion = new PlanificacionViewModel
            //{
            //    NombreDia = "Mie",
            //    Conductor = "Cesar",
            //    Unidad = "V3U-828",
            //    DiaUno = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "San Luis",
            //        Ruta = "Mollendo - Arequipa",
            //        UnidadMedida = "Galones",
            //        Carga = "Gasolina"
            //    },
            //    DiaDos = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "San Luis",
            //        Ruta = "Mollendo - Arequipa",
            //        UnidadMedida = "Galones",
            //        Carga = "Gasolina"
            //    },
            //    DiaTres = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "San Luis",
            //        Ruta = "Mollendo - Arequipa",
            //        UnidadMedida = "Galones",
            //        Carga = "Gasolina"
            //    },
            //    DiaCuatro = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "San Luis",
            //        Ruta = "Mollendo - Arequipa",
            //        UnidadMedida = "Galones",
            //        Carga = "Gasolina"
            //    }
            //};

            //listaPlanificacion.Add(planificacion);

            //planificacion = new PlanificacionViewModel
            //{
            //    NombreDia = "Jue",
            //    Conductor = "Elmer",
            //    Unidad = "V1Y-934",
            //    DiaUno = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "Raciemsa",
            //        Ruta = "Yura - Tacna",
            //        UnidadMedida = "Toneladas",
            //        Carga = "Soya",
            //        SinAsignacion = false
            //    },
            //    DiaDos = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "Raciemsa",
            //        Ruta = "Yura - Tacna",
            //        UnidadMedida = "Toneladas",
            //        Carga = "Soya",
            //        SinAsignacion = false
            //    },
            //    DiaTres = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "Raciemsa",
            //        Ruta = "Yura - Tacna",
            //        UnidadMedida = "Toneladas",
            //        Carga = "Soya",
            //        SinAsignacion = true
            //    },
            //    DiaCuatro = new DetallePlanificacionViewModel
            //    {
            //        Cliente = string.Empty,
            //        Ruta = string.Empty,
            //        UnidadMedida = string.Empty,
            //        Carga = string.Empty,
            //        SinAsignacion = false
            //    }
            //};

            //listaPlanificacion.Add(planificacion);

            //planificacion = new PlanificacionViewModel
            //{
            //    NombreDia = "Vie",
            //    Conductor = "Omar",
            //    Unidad = "V4U-835",
            //    DiaUno = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "FoodMarket",
            //        Ruta = "Matarani - San Jose",
            //        UnidadMedida = "Toneladas",
            //        Carga = "Papas",
            //        SinAsignacion = true
            //    },
            //    DiaDos = new DetallePlanificacionViewModel
            //    {
            //        Cliente = String.Empty,
            //        Ruta = String.Empty,
            //        UnidadMedida = String.Empty,
            //        Carga = String.Empty,
            //        SinAsignacion = false
            //    },
            //    DiaTres = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "Raciemsa",
            //        Ruta = "Yura - Tacna",
            //        UnidadMedida = "Toneladas",
            //        Carga = "Soya",
            //        SinAsignacion = false
            //    },
            //    DiaCuatro = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "Raciemsa",
            //        Ruta = "Yura - Tacna",
            //        UnidadMedida = "Toneladas",
            //        Carga = "Soya",
            //        SinAsignacion = false
            //    }
            //};

            //listaPlanificacion.Add(planificacion);

            //planificacion = new PlanificacionViewModel
            //{
            //    NombreDia = "Sab",
            //    Conductor = "Henry",
            //    Unidad = "V3Z-779",
            //    DiaUno = new DetallePlanificacionViewModel
            //    {
            //        Cliente = "Scharf",
            //        Ruta = "Matarani - Arequipa",
            //        UnidadMedida = "Toneladas",
            //        Carga = "Camote",
            //        SinAsignacion = true
            //    },
            //    DiaDos = new DetallePlanificacionViewModel
            //    {
            //        Cliente = String.Empty,
            //        Ruta = String.Empty,
            //        UnidadMedida = String.Empty,
            //        Carga = String.Empty,
            //        SinAsignacion = true
            //    },
            //    DiaTres = new DetallePlanificacionViewModel
            //    {
            //        Cliente = String.Empty,
            //        Ruta = String.Empty,
            //        UnidadMedida = String.Empty,
            //        Carga = String.Empty,
            //        SinAsignacion = false
            //    },
            //    DiaCuatro = new DetallePlanificacionViewModel
            //    {
            //        Cliente = String.Empty,
            //        Ruta = String.Empty,
            //        UnidadMedida = String.Empty,
            //        Carga = String.Empty,
            //        SinAsignacion = false
            //    }
            //};

            //listaPlanificacion.Add(planificacion);

            //return listaPlanificacion;
		}

        public int GrabarPlanificacion(Planificacion planificacion)
        {
            return planificacion.IdPlanificacion == 0 ? Data.DbHelper.Insert(planificacion) : Data.DbHelper.Update(planificacion);
        }

        //public int ObtenerPlanificacionPorId(int idPlanificacion)
        //{
            
        //    return planificacion.IdPlanificacion == 0 ? Data.DbHelper.Insert(planificacion) : Data.DbHelper.Update(planificacion);
        //}

        public PlanificacionViewModel ObtenerPlanificacionPorId(int idPlanificacion)
        {
            var planificacionData = new PlanificacionDataAccess();
            return new PlanificacionViewModel {  DatosPlanificacion = planificacionData.ObtenerPlanificacionPorId(idPlanificacion) };
        }
    }
}