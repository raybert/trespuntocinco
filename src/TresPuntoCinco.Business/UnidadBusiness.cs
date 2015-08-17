using System.Linq;
using TresPuntoCinco.DataAccess;
using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;

namespace TresPuntoCinco.Business
{
    public class UnidadBusiness
    {
        public UnidadViewModel ObtenerUnidades()
        {
            var unidades = (new UnidadDataAccess()).ObtenerUnidades();
            var empresas = (new EmpresaDataAccess()).ObtenerEmpresas();
            var tipoUnidades = (new TipoUnidadDataAccess().ObtenerTiposUnidad());

            var unidadesTemp = ( from e in empresas
                                     join u in unidades on e.IdEmpresa equals u.IdEmpresa
                                   select new Unidad { IdUnidad = u.IdUnidad, Placa = u.Placa, Capacidad = u.Capacidad, IdEmpresa = u.IdEmpresa, RazonSocial = e.RazonSocial, IdTipoUnidad = u.IdTipoUnidad} ).ToList();

            var unidadesEmpresas = (from t in tipoUnidades
                join u in unidadesTemp on t.IdTipoUnidad equals u.IdTipoUnidad
                select
                    new Unidad
                    {
                        IdUnidad = u.IdUnidad,
                        Placa = u.Placa,
                        Capacidad = u.Capacidad,
                        IdEmpresa = u.IdEmpresa,
                        RazonSocial = u.RazonSocial,
                        Tipo = t.Tipo
                    }).ToList();

            return new UnidadViewModel { ListaUnidades = unidadesEmpresas };
        }

        public UnidadViewModel ObtenerUnidadPorCodigo(int idUnidad)
        {
            var unidadData = new UnidadDataAccess();
            return new UnidadViewModel { DatosUnidad = unidadData.ObtenerUnidadPorIdentificacion(idUnidad) };
        }

        public int GrabarUnidad(Unidad unidad)
        {
            return unidad.IdUnidad == 0 ? Data.DbHelper.Insert(unidad) : Data.DbHelper.Update(unidad);
        }
    }
}
