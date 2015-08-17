using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using TresPuntoCinco.Business;

namespace TresPuntoCinco
{
    public partial class ListadoUnidad : Page
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
            var unidadBusiness = new UnidadBusiness();
            ListaUnidades.DataSource = (unidadBusiness.ObtenerUnidades()).ListaUnidades;
            ListaUnidades.DataBind();
	    }

        protected void ListaUnidades_SelectedIndexChanged(object sender, EventArgs e)
	    {
		    var selectedDataKey = ((GridView) sender).SelectedDataKey;
	        if (selectedDataKey == null) return;
            var idLugar = selectedDataKey.Value.ToString();
            Response.Redirect("EditarUnidad.aspx?IdUnidad=" + idLugar, true);
	    }

        protected void NuevaUnidad_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EditarUnidad.aspx", true);
        }
    }
}