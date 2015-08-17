<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ListadoColaborador.aspx.cs" Inherits="TresPuntoCinco.ListadoColaborador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page">
        <div id="main-content" class="clearfix">
            <div id="breadcrumbs">
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i><a href="#">Inicio</a> <span class="divider"><i class="icon-angle-right">
                    </i></span></li>
                    <li class="active">Colaboradores</li>
                </ul>
            </div>
            <div id="page-content" class="clearfix">
                <div class="page-header position-relative">
                    <h1>
                        Colaborador <small><i class="icon-double-angle-right"></i>&nbsp;Informaci&oacute;n de
                            colaboradores </small>
                    </h1>
                </div>
                <hr />
                 <p style="text-align: right">
                    <button class="btn btn-info" runat="server" id="NuevoColaborador" onserverclick="NuevoColaborador_OnClick">
                        <i class="icon-plus-sign bigger-120"></i>&nbsp;Nuevo Colaborador
                    </button>
                    <!--<button class="btn btn-success">
                        <i class="icon-download-alt bigger-120"></i>&nbsp;Exportar
                    </button>-->
                </p>
                <hr />
                <!--/.page-header-->
                <div class="row-fluid">
                    <div class="span12">
                        <asp:GridView ID="ListaColaboradores" class="table table-striped table-bordered table-hover"
                            runat="server" AutoGenerateColumns="False" DataKeyNames="IdColaborador"
                            onselectedindexchanged="ListaColaboradores_SelectedIndexChanged">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" SelectText="Editar" />
                                <asp:BoundField DataField="IdColaborador" HeaderText="IdColaborador" Visible="False" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" />
                                <asp:BoundField DataField="Documento" HeaderText="Documento" />
                                <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <!--/span-->
                </div>
                <!--/row-->
            </div>
        </div>
    </div>
</asp:Content>
