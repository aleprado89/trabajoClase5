<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="trabajoClase5.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                CUENTAS<br />
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/cuentasAlta.aspx">Alta de Cuentas</asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/cuentasBaja.aspx">Baja de Cuentas</asp:HyperLink>
                <br />
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/cuentasModificacion.aspx">Modificar Cuentas</asp:HyperLink>
                <br />
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel2" runat="server">
                REGISTROS CONTABLES<br />
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/registrosContablesAlta.aspx">Alta de Registros Contables</asp:HyperLink>
            </asp:Panel>
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/registrosContablesBaja.aspx">Baja de Registros Contables</asp:HyperLink>
            <br />
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/registrosContablesModificacion.aspx">Modificar Registros Contables</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
