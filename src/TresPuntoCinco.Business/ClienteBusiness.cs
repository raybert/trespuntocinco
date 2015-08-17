using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;
using TresPuntoCinco.DataAccess;

namespace TresPuntoCinco.Business
{
    public class ClienteBusiness
    {
        public ClienteViewModel ObtenerClientes(bool estado)
        {
            var clienteData = new ClienteDataAccess();
            return new ClienteViewModel { ListaClientes = clienteData.ObtenerClientes(estado) };
        }

        public ClienteViewModel ObtenerClientesPorCodigo(int idCliente)
        {
            var clienteData = new ClienteDataAccess();
            return new ClienteViewModel { DatosCliente = clienteData.ObtenerClientePorIdentificacion(idCliente) };
        }

        public int GrabarCliente(Cliente cliente)
        {
            return cliente.IdCliente == 0 ? Data.DbHelper.Insert(cliente) : Data.DbHelper.Update(cliente);
        }
    }
}
