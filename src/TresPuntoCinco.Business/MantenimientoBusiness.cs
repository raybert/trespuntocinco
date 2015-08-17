using System;
using System.Linq;
using TresPuntoCinco.DataAccess;
using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;

namespace TresPuntoCinco.Business
{
    public class MantenimientoBusiness
    {
        public MantenimientoViewModel ObtenerMantenimientos(DateTime fechaInicio, DateTime fechaFin)
        {
            var mantenimientos = (new MantenimientoDataAccess().ObtenerMantenimientos(fechaInicio, fechaFin));
            return new MantenimientoViewModel { ListaMantenimientos = mantenimientos };
        }

        public MantenimientoViewModel ObtenerMantenimientoPorCodigo(int idMantenimiento)
        {
            var mantData = new MantenimientoDataAccess();
            return new MantenimientoViewModel { DatosMantenimiento = mantData.ObtenerMentenimientosPorIdentificacion(idMantenimiento) };
        }

        public int GrabarMantenimiento(Mantenimiento mantenimiento)
        {
            return mantenimiento.IdMantenimiento== 0 ? Data.DbHelper.Insert(mantenimiento) : Data.DbHelper.Update(mantenimiento);
        }
    }
}
