using System;
using System.Web.UI.WebControls;
using TresPuntoCinco.Business;

namespace TresPuntoCinco
{
    public partial class ListadoColaborador : System.Web.UI.Page
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
            var colaboradorBusiness = new ColaboradorBusiness();
            ListaColaboradores.DataSource = (colaboradorBusiness.ObtenerColaboradores(true)).ListaColaboradores;
            ListaColaboradores.DataBind();
        }

        protected void NuevoColaborador_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EditarColaborador.aspx", true);
        }

        protected void ListaColaboradores_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedDataKey = ((GridView)sender).SelectedDataKey;
            if (selectedDataKey == null) return;

            var idColaborador = selectedDataKey.Value.ToString();
            Response.Redirect("EditarColaborador.aspx?IdColaborador=" + idColaborador, true);
        }
	}
}