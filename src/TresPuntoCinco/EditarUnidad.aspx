<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EditarUnidad.aspx.cs" Inherits="TresPuntoCinco.EditarUnidad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Unidad</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Unidad <small><i class="icon-double-angle-right"></i>&nbsp;Editar informaci&oacute;n
                        </small>
                    </h1>
                </div>
                <!--/.page-header-->
                <div class="form-horizontal">
                    <div class="control-group">
                        <label class="control-label">
                            Placa:</label>
                        <div class="controls">
                            <asp:TextBox ID="Placa" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Capacidad:</label>
                        <div class="controls">
                            <asp:TextBox ID="Capacidad" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Empresa:</label>
                        <div class="controls">
                            <asp:DropDownList ID="Empresa" class="form-control" runat="server" DataValueField="IdEmpresa" DataTextField="RazonSocial"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Tipo de Unidad:</label>
                        <div class="controls">
                            <asp:DropDownList ID="TipoUnidad" class="form-control" runat="server" DataValueField="IdTipounidad" DataTextField="Tipo"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Marca:</label>
                        <div class="controls">
                            <asp:TextBox ID="Marca" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Modelo:</label>
                        <div class="controls">
                            <asp:TextBox ID="Modelo" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">
                            Unidad de medida:</label>
                        <div class="controls">
                            <asp:DropDownList ID="UnidadesMedida" class="form-control" runat="server" DataValueField="IdUnidadMedida" DataTextField="Medida"></asp:DropDownList>
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
