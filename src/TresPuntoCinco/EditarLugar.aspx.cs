using System;
using System.Web.UI;
using TresPuntoCinco.Business;
using TresPuntoCinco.Model;

namespace TresPuntoCinco
{
    public partial class EditarLugar : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            if (Request.QueryString["IdLugar"] == null) return;

            var idLugar = Request.QueryString["IdLugar"];
            ObtenerDatosLugar(Convert.ToInt32(idLugar));
        }

        private void ObtenerDatosLugar(int idLugar)
        {
            var lugarBusiness = new LugarBusiness();
            var lugar = lugarBusiness.ObtenerLugarPorCodigo(idLugar).DatosLugar;
            if (lugar == null) return;

            NombreCortoLugar.Text = lugar.NombreCorto;
            Nombre.Text = lugar.NombreLugar;
        }

        protected void Grabar_OnClick(object sender, EventArgs e)
        {
            var lugarNegocio = new LugarBusiness();
            var lugar = new Lugar
                {
                    NombreLugar = Nombre.Text,
                    NombreCorto = NombreCortoLugar.Text
                };

            if (Request.QueryString["IdLugar"] != null)
                lugar.IdLugar = Convert.ToInt32(Request.QueryString["IdLugar"]);
            
            lugarNegocio.GrabarLugar(lugar);
            Response.Redirect("ListadoLugar.aspx");
        }

        protected void Cancelar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ListadoLugar.aspx");
        }
    }
}