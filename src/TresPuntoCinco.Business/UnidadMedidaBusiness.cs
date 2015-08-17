using TresPuntoCinco.DataAccess;
using TresPuntoCinco.ViewModel;

namespace TresPuntoCinco.Business
{
	public class UnidadMedidaBusiness
	{
        public UnidadMedidaViewModel ObtenerUnidadesMedida(bool estado)
        {
            var unidadMedidaData = new UnidadMedidaDataAccess();
            return new UnidadMedidaViewModel { ListaUnidadMedida = unidadMedidaData.ObtenerUnidadesMedida() };
        }

        public UnidadMedidaViewModel ObtenerLugarPorCodigo(int idUnidadMedida)
        {
            var unidadMedidaData = new UnidadMedidaDataAccess();
            return new UnidadMedidaViewModel { DatosUnidadMedida = unidadMedidaData.ObtenerUnidadMedidaPorIdentificacion(idUnidadMedida) };
        }

        //public int GrabarLugar(Lugar lugar)
        //{
        //    return lugar.IdLugar == 0 ? Data.DbHelper.Insert(lugar) : Data.DbHelper.Update(lugar);
        //}
	}
}
