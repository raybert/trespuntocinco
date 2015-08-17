<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditarCliente.aspx.cs" Inherits="TresPuntoCinco.EditarCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Editar Informaci&oacute;n de Clientes</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Clientes <small><i class="icon-double-angle-right"></i>&nbsp;Informaci&oacute;n de Clientes
                        </small>
                    </h1>
                </div>
                <!-- PAGE CONTENT BEGINS -->
                <div class="row-fluid">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= NombreCliente.ClientID %>">
                            Nombre Cliente
                        </label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="NombreCliente" runat="server" placeholder="Nombre del Cliente" class="col-xs-10 col-sm-5"></asp:TextBox>
                        </div>
                    </div>
                    <div class="space-4">
                    </div>
                    <div class="form-group">
                        <%--
		public string Url { get; set; }
		public string Telefono { get; set; }
		public string Direccion { get; set; }
                        --%>
                        <label class="col-sm-3 control-label no-padding-right" for="<%= NumeroRuc.ClientID %>">
                            N&uacute;mero de RUC
                        </label>
                        <div class="col-sm-9">
                            <asp:TextBox ID="NumeroRuc" runat="server" placeholder="RUC" class="col-xs-10 col-sm-5"></asp:TextBox>
                        </div>
                    </div>
                    <div class="space-4">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= PaginaWeb.ClientID %>">
                            Pagina Web
                        </label>
                        <div class="col-sm-9">
                            <span class="input-icon">
                                <asp:TextBox ID="PaginaWeb" runat="server" placeholder="P&aacute;gina Web" class="col-xs-10 col-sm-5"></asp:TextBox>
                                <i class="icon-link blue"></i></span>
                        </div>
                    </div>
                    <div class="space-4">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= Telefono.ClientID %>">
                            Telefono
                        </label>
                        <div class="col-sm-9">
                            <span class="input-icon">
                                <asp:TextBox ID="Telefono" runat="server" placeholder="Tel&eacute;fono" class="col-xs-10 col-sm-5"></asp:TextBox>
                                <i class="icon-phone blue"></i></span>
                        </div>
                    </div>
                    <div class="space-4">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= Domicilio.ClientID %>">
                            Direcci&oacute;n:
                        </label>
                        <div class="col-sm-9">
                            <span class="input-icon">
                                <asp:TextBox ID="Domicilio" runat="server" placeholder="Direcci&oacute;n" class="col-xs-10 col-sm-5"></asp:TextBox>
                                <i class=" icon-location-arrow blue"></i></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="<%= Contacto.ClientID %>">
                            Datos de Contacto
                        </label>
                        <div class="col-sm-9">
                            <span class="input-icon">
                                <asp:TextBox ID="Contacto" runat="server" placeholder="Contacto" class="col-xs-10 col-sm-10"></asp:TextBox>
                                <i class=" icon-location-arrow blue"></i></span>
                        </div>
                    </div>
                    <div class="clearfix form-actions">
                        <div class="col-md-offset-3 col-md-9">
                            <asp:Button ID="Grabar" class="btn btn-info" runat="server" Text="Grabar" OnClick="Grabar_OnClick" />
                            &nbsp; &nbsp; &nbsp;
                            <asp:Button ID="Cancelar" class="btn btn-danger" runat="server" Text="Cancelar" OnClick="Cancelar_OnClick" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
