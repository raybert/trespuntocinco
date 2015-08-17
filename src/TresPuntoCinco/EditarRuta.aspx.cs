using System;
using System.Globalization;
using System.Web.UI;
using TresPuntoCinco.Business;
using TresPuntoCinco.Model;

namespace TresPuntoCinco
{
    public partial class EditarRuta : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;

            var lugares = new LugarBusiness();
            RutaOrigen.DataSource = lugares.ObtenerLugares(true).ListaLugares;
            RutaOrigen.DataBind();
            RutaDestino.DataSource = lugares.ObtenerLugares(true).ListaLugares;
            RutaDestino.DataBind();

            if (Request.QueryString["IdRuta"] == null) return;

            var idRuta = Request.QueryString["IdRuta"];
            ObtenerDatosRuta(Convert.ToInt32(idRuta));
        }

        private void ObtenerDatosRuta(int idRuta)
        {
            var rutaBusiness = new RutaBusiness();
            var ruta = rutaBusiness.ObtenerRutaPorCodigo(idRuta).DatosRuta;
            if (ruta == null) return;

            NombreCortoLugar.Text = ruta.NombreCorto;
            Nombre.Text = ruta.NombreRuta;
            TiempoViaje.Text = ruta.TiempoViaje.ToString(CultureInfo.InvariantCulture);
            Kilometraje.Text = ruta.Kilometraje.ToString(CultureInfo.InvariantCulture);
            RutaOrigen.Items.FindByValue(ruta.Origen.ToString(CultureInfo.InvariantCulture)).Selected = true;
            RutaDestino.Items.FindByValue(ruta.Destino.ToString(CultureInfo.InvariantCulture)).Selected = true;
        }

        protected void Grabar_OnClick(object sender, EventArgs e)
        {
            var rutaNegocio = new RutaBusiness();
            var origen = (new LugarBusiness()).ObtenerLugarPorCodigo(Convert.ToInt32(RutaOrigen.SelectedItem.Value)).DatosLugar;
            var destino = (new LugarBusiness()).ObtenerLugarPorCodigo(Convert.ToInt32(RutaDestino.SelectedItem.Value)).DatosLugar;
            
            var ruta = new Ruta
                {
                    NombreRuta = string.IsNullOrEmpty(Nombre.Text) ? string.Format("{0}-{1}", origen.NombreLugar, destino.NombreLugar) : Nombre.Text,
                    NombreCorto = string.IsNullOrEmpty(NombreCortoLugar.Text) ? string.Format("{0}-{1}", origen.NombreCorto, destino.NombreCorto) : Nombre.Text,
                    Origen = origen.IdLugar,
                    Destino = destino.IdLugar,
                    Kilometraje = Convert.ToInt32(string.IsNullOrEmpty(Kilometraje.Text) ? "0" : Kilometraje.Text),
                    TiempoViaje = Convert.ToInt32(string.IsNullOrEmpty(TiempoViaje.Text) ? "0" : TiempoViaje.Text)
                };

            if (Request.QueryString["IdRuta"] != null)
                ruta.IdRuta = Convert.ToInt32(Request.QueryString["IdRuta"]);
            
            rutaNegocio.GrabarRuta(ruta);
            Response.Redirect("ListadoRuta.aspx");
        }

        protected void Cancelar_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("ListadoRuta.aspx");
        }
    }
}