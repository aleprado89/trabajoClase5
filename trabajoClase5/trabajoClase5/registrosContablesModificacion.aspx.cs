using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace trabajoClase5
{
    public partial class registrosContablesModificacion : System.Web.UI.Page
    {
        //LOAD
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //BOTONES
        //Buscar
        protected void buscarBT_Click(object sender, EventArgs e)
        {
            panelModificacion.Enabled = false;
            if (idRegistroTB.Text != "")
            {
                this.SqlDataSourceRegistros.SelectParameters["idRegistrosContables"].DefaultValue = this.idRegistroTB.Text;
                this.SqlDataSourceRegistros.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros;
                registros = (SqlDataReader)SqlDataSourceRegistros.Select(DataSourceSelectArguments.Empty);

                if (registros.Read())
                {
                    string datos;
                    this.idLB.Text = registros["idRegistrosContables"].ToString();
                    datos = "Cuenta: " + registros["descripcion"].ToString() + ", Monto: " +
                        registros["monto"].ToString();

                    cuentaDDL.SelectedValue = registros["idCuenta"].ToString();
                    montoTB.Text = registros["monto"].ToString();                    

                    if (registros["tipo"].ToString() == "1")
                    {
                        datos = datos + ", Tipo: " + "Haber";
                        tipoDDL.SelectedValue = "1";
                    }
                    else
                    {
                        datos = datos + ", Tipo: " + "Debe";
                        tipoDDL.SelectedValue = "0";
                    }
                    datosLB.Text = datos;

                    panelModificacion.Enabled = true;
                }
                else
                {
                    this.resultadoLB.Text = "No existe el Registro.";
                }
            }
            else
            {
                this.resultadoLB.Text = "Faltan cargar datos.";
            }
        }
        //Actualizar
        protected void actualizarBT_Click(object sender, EventArgs e)
        {
            if (idLB.Text != "-")
            {
                this.SqlDataSourceRegistros.UpdateParameters["idRegistrosContables"].DefaultValue = idLB.Text;
                this.SqlDataSourceRegistros.UpdateParameters["idCuenta"].DefaultValue = cuentaDDL.SelectedValue;
                this.SqlDataSourceRegistros.UpdateParameters["monto"].DefaultValue = montoTB.Text;
                this.SqlDataSourceRegistros.UpdateParameters["tipo"].DefaultValue = tipoDDL.SelectedValue;
                this.SqlDataSourceRegistros.Update();
                this.resultadoLB.Text = "Se actualizó el Registro Contable con Id: " + idLB.Text;

                panelModificacion.Enabled = false;
                idLB.Text = "-";
                datosLB.Text = "-";
                montoTB.Text = "";                
            }
            else
            {
                this.resultadoLB.Text = "No se busco el Registro.";
            }
        }
    }
}