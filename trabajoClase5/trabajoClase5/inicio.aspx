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
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/gestionarCuentas.aspx">Gestionar Cuentas</asp:HyperLink>
                <br />
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel2" runat="server">
                REGISTROS CONTABLES<br />
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/gestionarRegistrosContables.aspx">Gestionar Registros Contables</asp:HyperLink>
                <br />
            </asp:Panel>
            <br />
        </div>
    </form>
</body>
</html>
