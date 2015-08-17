<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditarLugar.aspx.cs" Inherits="TresPuntoCinco.EditarLugar" %>

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
                        Lugar <small><i class="icon-double-angle-right"></i>&nbsp;Editar informaci&oacute;n
                        </small>
                    </h1>
                </div>
                <!--/.page-header-->
                <div class="form-horizontal">
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
                            <asp:TextBox ID="NombreCortoLugar" runat="server"></asp:TextBox>
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
