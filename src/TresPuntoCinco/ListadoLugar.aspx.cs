using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using TresPuntoCinco.Business;

namespace TresPuntoCinco
{
    public partial class ListadoLugar : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
	        RecuperarDatos();
        }

	    private void RecuperarDatos()
	    {
            var lugarBusiness = new LugarBusiness();
            ListaLugares.DataSource = (lugarBusiness.ObtenerLugares(true)).ListaLugares;
            ListaLugares.DataBind();
	    }

        protected void ListaLugares_SelectedIndexChanged(object sender, EventArgs e)
	    {
		    var selectedDataKey = ((GridView) sender).SelectedDataKey;
	        if (selectedDataKey == null) return;
            var idLugar = selectedDataKey.Value.ToString();
            Response.Redirect("EditarLugar.aspx?IdLugar=" + idLugar, true);
	    }

        protected void NuevoLugar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("EditarLugar.aspx", true);
        }
    }
}