using System;
using System.Web.UI.WebControls;
using TresPuntoCinco.Business;

namespace TresPuntoCinco
{
    public partial class ListadoClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RecuperarDatos();
            }
        }

        private void RecuperarDatos()
        {
            var clientesBusiness = new ClienteBusiness();
            ListaClientes.DataSource = (clientesBusiness.ObtenerClientes(true)).ListaClientes;
            ListaClientes.DataBind();
        }

        protected void ListaClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void NuevoCliente_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EditarCliente.aspx");
        }

        protected void ListaClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedDataKey = ((GridView)sender).SelectedDataKey;
            if (selectedDataKey == null) return;
            var idCliente = selectedDataKey.Value.ToString();
            Response.Redirect("EditarCliente.aspx?IdCliente=" + idCliente, true);
        }
    }
}