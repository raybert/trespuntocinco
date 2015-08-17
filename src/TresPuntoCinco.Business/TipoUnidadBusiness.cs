using TresPuntoCinco.DataAccess;
using TresPuntoCinco.ViewModel;

namespace TresPuntoCinco.Business
{
    public class TipoUnidadBusiness
    {
        public TipoUnidadViewModel ObtenerTipoUnidad()
        {
            var tipoUnidadData = new TipoUnidadDataAccess();
            return new TipoUnidadViewModel { ListaTipoUnidad = tipoUnidadData.ObtenerTiposUnidad() };
        }
    }
}
