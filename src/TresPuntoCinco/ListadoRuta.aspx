<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListadoRuta.aspx.cs" Inherits="TresPuntoCinco.ListadoRuta" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Rutas</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Rutas <small><i class="icon-double-angle-right"></i>&nbsp;Listado de rutas
                        </small>
                    </h1>
                </div>
                <hr />
                 <p style="text-align: right">
                    <button class="btn btn-info" runat="server" OnServerClick="NuevaRuta_OnClick">
                        <i class="icon-plus-sign bigger-120"></i>&nbsp;Nueva Ruta
                    </button>
<%--                    <button class="btn btn-success">
                        <i class="icon-download-alt bigger-120"></i>&nbsp;Exportar
                    </button>
--%>
                </p>
                <hr />
                <div class="row-fluid">
                    <div class="table-responsive">
                        <asp:GridView ID="ListaRutas" runat="server" CssClass="table table-striped table-bordered table-hover"
                            AutoGenerateColumns="False" DataKeyNames="IdRuta" OnSelectedIndexChanged="ListaRutas_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" />
                                <asp:BoundField DataField="IdRuta" HeaderText="IdRuta" Visible="False" />
                                <asp:BoundField DataField="Origen" HeaderText="Origen" Visible="False" />
                                <asp:BoundField DataField="Destino" HeaderText="Destino" Visible="False" />
                                <asp:BoundField DataField="NombreRuta" HeaderText="Nombre de ruta" />
                                <asp:BoundField DataField="NombreCorto" HeaderText="Nombre corto" />
                                <asp:BoundField DataField="TiempoViaje" HeaderText="Tiempo de viaje" />
                                <asp:BoundField DataField="Kilometraje" HeaderText="Kilometraje" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
