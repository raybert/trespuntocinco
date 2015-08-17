using TresPuntoCinco.DataAccess;
using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;

namespace TresPuntoCinco.Business
{
	public class LugarBusiness
	{
        public LugarViewModel ObtenerLugares(bool estado)
        {
            var lugarData = new LugarDataAccess();
            return new LugarViewModel { ListaLugares = lugarData.ObtenerLugares() };
        }

        public LugarViewModel ObtenerLugarPorCodigo(int idLugar)
        {
            var lugarData = new LugarDataAccess();
            return new LugarViewModel { DatosLugar = lugarData.ObtenerLugarPorIdentificacion(idLugar) };
        }

        public int GrabarLugar(Lugar lugar)
        {
            return lugar.IdLugar == 0 ? Data.DbHelper.Insert(lugar) : Data.DbHelper.Update(lugar);
        }
	}
}
