using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using TresPuntoCinco.Business;

namespace TresPuntoCinco
{
    public partial class ListadoRuta : Page
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
            var rutaBusiness = new RutaBusiness();
            ListaRutas.DataSource = (rutaBusiness.ObtenerRutas()).ListaRutas;
            ListaRutas.DataBind();
	    }

        protected void ListaRutas_SelectedIndexChanged(object sender, EventArgs e)
	    {
		    var selectedDataKey = ((GridView) sender).SelectedDataKey;
	        if (selectedDataKey == null) return;
            var idRuta = selectedDataKey.Value.ToString();
            Response.Redirect("EditarRuta.aspx?IdRuta=" + idRuta, true);
	    }

        protected void NuevaRuta_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EditarRuta.aspx", true);
        }
    }
}