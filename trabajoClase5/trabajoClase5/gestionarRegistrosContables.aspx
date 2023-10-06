<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionarRegistrosContables.aspx.cs" Inherits="trabajoClase5.gestionarRegistrosContables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Height="633px">
            Registros Contables<br /> Seleccionar identificador del registro:<br />
            <asp:DropDownList ID="registrosCargadosDDL" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceRegistros" DataTextField="idRegistrosContables" DataValueField="idRegistrosContables" Height="29px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="449px">
            </asp:DropDownList>
            <asp:Button ID="eliminarBT" runat="server" OnClick="eliminarBT_Click" Text="Eliminar" Width="150px" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Cliente:"></asp:Label>
            <br />
            <asp:DropDownList ID="cuentaDDL" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCuentas" DataTextField="descripcion" DataValueField="idCuenta" Width="300px">
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Monto:"></asp:Label>
            <br />
            <asp:TextBox ID="montoTB" runat="server" Width="291px"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Tipo:"></asp:Label>
            <br />
            <asp:DropDownList ID="tipoDDL" runat="server" Width="297px">
                <asp:ListItem Value="0">Debe</asp:ListItem>
                <asp:ListItem Value="1">Haber</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="agregarBT" runat="server" OnClick="agregarBT_Click" Text="Agregar Registro" Width="152px" />
            <asp:Button ID="modificarBT" runat="server" OnClick="modificarBT_Click" Text="Modificar" Width="145px" />
            <br />
            <br />
            Listado de Registros Cargados<br />
            <asp:Table ID="registrosTabla" runat="server" Width="554px" BorderStyle="Solid" BorderWidth="1px">
            </asp:Table>
            <br />
            <asp:Label ID="resultadoLB" runat="server" Text="-"></asp:Label>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/inicio.aspx">Volver</asp:HyperLink>
            <br />
            <asp:SqlDataSource ID="SqlDataSourceCuentas" runat="server" ConnectionString="Data Source=ALEJANDRO;Initial Catalog=clase5;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceRegistrosTabla" runat="server" ConnectionString="<%$ ConnectionStrings:clase5ConnectionString %>" DeleteCommand="DELETE FROM RegistrosContables WHERE (idRegistrosContables = @idRegistrosContables)" InsertCommand="INSERT INTO RegistrosContables(idCuenta, monto, tipo) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT RegistrosContables.idRegistrosContables, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.idCuenta">
                <DeleteParameters>
                    <asp:Parameter Name="idRegistrosContables" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="cuentaDDL" Name="idCuenta" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="montoTB" Name="monto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="tipoDDL" Name="tipo" PropertyName="SelectedValue" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceRegistros" runat="server" ConnectionString="<%$ ConnectionStrings:clase5ConnectionString %>" DeleteCommand="DELETE FROM RegistrosContables WHERE (idRegistrosContables = @idRegistrosContables)" InsertCommand="INSERT INTO RegistrosContables(idCuenta, monto, tipo) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT RegistrosContables.idRegistrosContables, RegistrosContables.idCuenta, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idCuenta = Cuentas.idCuenta">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="registrosCargadosDDL" Name="idRegistrosContables" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="cuentaDDL" Name="idCuenta" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="montoTB" Name="monto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="tipoDDL" Name="tipo" PropertyName="SelectedValue" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceRegistrosModificar" runat="server" ConnectionString="<%$ ConnectionStrings:clase5ConnectionString %>" DeleteCommand="DELETE FROM RegistrosContables WHERE (idRegistrosContables = @idRegistrosContables)" InsertCommand="INSERT INTO RegistrosContables(idCuenta, monto, tipo) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT idRegistrosContables, idCuenta, monto, tipo FROM RegistrosContables WHERE (idRegistrosContables = @idRegistrosContables)" UpdateCommand="UPDATE RegistrosContables SET idCuenta = @idCuenta, monto = @monto, tipo = @tipo WHERE (idRegistrosContables = @idRegistrosContables)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="idRegistrosContables" PropertyName="SelectedValue" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="cuentaDDL" Name="idCuenta" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="montoTB" Name="monto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="tipoDDL" Name="tipo" PropertyName="SelectedValue" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="registrosCargadosDDL" Name="idRegistrosContables" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="montoTB" Name="monto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="tipoDDL" Name="tipo" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="registrosCargadosDDL" Name="idRegistrosContables" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="cuentaDDL" Name="idCuenta" PropertyName="SelectedValue" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <p>
            &nbsp;</p>
    </form>    
</body>
</html>
