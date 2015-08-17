using System.Linq;
using TresPuntoCinco.DataAccess;
using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;

namespace TresPuntoCinco.Business
{
    public class EmpresaBusiness
    {
        public EmpresaViewModel ObtenerEmpresas()
        {
            var empresa = (new EmpresaDataAccess().ObtenerEmpresas());

            return new EmpresaViewModel { ListaEmpresas = empresa };
        }
    }
}
