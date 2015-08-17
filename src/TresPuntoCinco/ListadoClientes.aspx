<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListadoClientes.aspx.cs" Inherits="TresPuntoCinco.ListadoClientes" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Clientes</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Clientes <small><i class="icon-double-angle-right"></i>&nbsp;Listado de Clientes
                        </small>
                    </h1>
                </div>
                <hr />
                 <p style="text-align: right">
                    <button class="btn btn-info" runat="server" id="NuevoCliente" type="button" onserverclick="NuevoCliente_OnClick">
                        <i class="icon-plus-sign bigger-120"></i>&nbsp;Nuevo Cliente
                    </button>
                    <!--<button class="btn btn-success">
                        <i class="icon-download-alt bigger-120"></i>&nbsp;Exportar
                    </button>-->
                </p>
                <hr />
                <div class="row-fluid">
                    <div class="table-responsive">
                        <asp:GridView ID="ListaClientes" runat="server" CssClass="table table-striped table-bordered table-hover"
                            AutoGenerateColumns="False" DataKeyNames="IdCliente" OnSelectedIndexChanged="ListaClientes_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" />
                                <asp:BoundField DataField="IdCliente" HeaderText="IdCliente" Visible="False" />
                                <asp:BoundField DataField="NumeroRuc" HeaderText="RUC" />
                                <asp:BoundField DataField="RazonSocial" HeaderText="Nombre" />
                                <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                                <asp:BoundField DataField="Url" HeaderText="Pagina Web" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
