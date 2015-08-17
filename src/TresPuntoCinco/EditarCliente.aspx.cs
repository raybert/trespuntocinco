using System;
using System.Web.UI;
using TresPuntoCinco.Business;
using TresPuntoCinco.Model;
using TresPuntoCinco.ViewModel;

namespace TresPuntoCinco
{
    public partial class EditarCliente : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["IdCliente"] != null)
                {
                    var idCliente = Request.QueryString["IdCliente"];
                    ObtenerDatosCliente(Convert.ToInt32(idCliente));
                }
            }
        }

        private void ObtenerDatosCliente(int idCliente)
        {
            var clientesBusiness = new ClienteBusiness();
            ClienteViewModel cliente = clientesBusiness.ObtenerClientesPorCodigo(idCliente);
            NombreCliente.Text = cliente.DatosCliente.RazonSocial;
            NumeroRuc.Text = cliente.DatosCliente.NumeroRuc;
            PaginaWeb.Text = cliente.DatosCliente.Url;
            Telefono.Text = cliente.DatosCliente.Telefono;
            Domicilio.Text = cliente.DatosCliente.Direccion;
            Contacto.Text = cliente.DatosCliente.Contacto;
        }

        protected void Grabar_OnClick(object sender, EventArgs e)
        {
            var clienteBusiness = new ClienteBusiness();
            var cliente = new Cliente
            {
                NumeroRuc = NumeroRuc.Text,
                Direccion = Domicilio.Text,
                Estado = "A",
                RazonSocial = NombreCliente.Text,
                Telefono = Telefono.Text,
                Url = PaginaWeb.Text,
                Contacto = Contacto.Text
            };

            if (Request.QueryString["IdCliente"] != null)
                cliente.IdCliente = Convert.ToInt32(Request.QueryString["IdCliente"]);

            clienteBusiness.GrabarCliente(cliente);
            Response.Redirect("ListadoClientes.aspx", true);
        }

        protected void Cancelar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ListadoClientes.aspx", true);
        }
    }
}