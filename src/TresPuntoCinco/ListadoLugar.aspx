<%@ Page Title="Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListadoLugar.aspx.cs" Inherits="TresPuntoCinco.ListadoLugar" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Lugares</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Lugares <small><i class="icon-double-angle-right"></i>&nbsp;Listado de Lugares
                        </small>
                    </h1>
                </div>
                <hr />
                 <p style="text-align: right">
                    <button class="btn btn-info" runat="server" OnServerClick="NuevoLugar_OnClick">
                        <i class="icon-plus-sign bigger-120"></i>&nbsp;Nuevo Lugar
                    </button>
                    <%--<button class="btn btn-success">
                        <i class="icon-download-alt bigger-120"></i>&nbsp;Exportar
                    </button>--%>
                </p>
                <hr />
                <div class="row-fluid">
                    <div class="table-responsive">
                        <asp:GridView ID="ListaLugares" runat="server" CssClass="table table-striped table-bordered table-hover"
                            AutoGenerateColumns="False" DataKeyNames="IdLugar" OnSelectedIndexChanged="ListaLugares_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" />
                                <asp:BoundField DataField="IdLugar" HeaderText="IdLugar" Visible="False" />
                                <asp:BoundField DataField="NombreLugar" HeaderText="Nombre" />
                                <asp:BoundField DataField="NombreCorto" HeaderText="Nombre corto" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
