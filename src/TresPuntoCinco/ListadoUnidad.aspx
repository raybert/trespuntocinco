<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListadoUnidad.aspx.cs" Inherits="TresPuntoCinco.ListadoUnidad" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Unidades de Transporte</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Unidades de Transporte <small><i class="icon-double-angle-right"></i>&nbsp;&nbsp;Informaci&oacute;n
                            de Unidades de transporte</small>
                    </h1>
                </div>
                <hr />
                 <p style="text-align: right">
                    <button class="btn btn-info" onserverclick="NuevaUnidad_OnClick" runat="server">
                        <i class="icon-plus-sign bigger-120"></i>&nbsp;Nueva Unidad
                    </button>
                </p>
                <hr />
                <div class="row-fluid">
                    <div class="table-responsive">
                        <asp:GridView ID="ListaUnidades" runat="server" CssClass="table table-striped table-bordered table-hover"
                            AutoGenerateColumns="False" DataKeyNames="IdUnidad" OnSelectedIndexChanged="ListaUnidades_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" />
                                <asp:BoundField DataField="IdUnidad" HeaderText="IdUnidad" Visible="False" />
                                <asp:BoundField DataField="IdEmpresa" HeaderText="IdEmpresa" Visible="False" />
                                <asp:BoundField DataField="Placa" HeaderText="Placa" />
                                <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                <asp:BoundField DataField="Capacidad" HeaderText="Capacidad" />
                                <asp:BoundField DataField="RazonSocial" HeaderText="Razon Social" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
