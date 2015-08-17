<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditarRuta.aspx.cs" Inherits="TresPuntoCinco.EditarRuta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Lugar</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Ruta <small><i class="icon-double-angle-right"></i>&nbsp;Editar informaci&oacute;n
                        </small>
                    </h1>
                </div>
                <!--/.page-header-->
                <div class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label">
                            Origen:</label>
                        <div class="controls">
                            <asp:DropDownList ID="RutaOrigen" class="chosen-select" data-placeholder="Escoja ruta"
                                runat="server" DataTextField="NombreLugar" DataValueField="IdLugar">
                                <asp:ListItem Value="3">fsdaf</asp:ListItem>
                                <asp:ListItem Value="2">ffds</asp:ListItem>
                                <asp:ListItem Value="3">sdfds</asp:ListItem>
                                <asp:ListItem Value="4">fsdg</asp:ListItem>
                                <asp:ListItem Value="5">gfbcncv</asp:ListItem>
                                <asp:ListItem Value="5">bvn</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Destino:</label>
                        <div class="controls">
                            <asp:DropDownList ID="RutaDestino" class="chosen-select" data-placeholder="Escoja ruta"
                                runat="server" DataTextField="NombreLugar" DataValueField="IdLugar">
                                <asp:ListItem Value="3">fsdaf</asp:ListItem>
                                <asp:ListItem Value="2">ffds</asp:ListItem>
                                <asp:ListItem Value="3">sdfds</asp:ListItem>
                                <asp:ListItem Value="4">fsdg</asp:ListItem>
                                <asp:ListItem Value="5">gfbcncv</asp:ListItem>
                                <asp:ListItem Value="5">bvn</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Nombre:</label>
                        <div class="controls">
                            <asp:TextBox ID="Nombre" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Nombre corto:</label>
                        <div class="controls">
                            <asp:TextBox ID="NombreCortoLugar" MaxLength="10" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Tiempo de viaje:</label>
                        <div class="controls">
                            <asp:TextBox ID="TiempoViaje" MaxLength="10" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Kilometraje:</label>
                        <div class="controls">
                            <asp:TextBox ID="Kilometraje" MaxLength="10" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="button" runat="server" id="Grabar" onserverclick="Grabar_OnClick">
                            <i class="icon-save bigger-110"></i>Grabar
                        </button>
                        &nbsp; &nbsp; &nbsp;
                        <button class="btn btn-danger" type="reset" runat="server" id="Cancelar" onserverclick="Cancelar_OnClick">
                            <i class="icon-undo bigger-110"></i>Cancelar
                        </button>
                    </div>
                    <div class="hr">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
