using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace TresPuntoCinco
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Ejecutar_Click(object sender, EventArgs e)
        {
            var logEventos =  new StringBuilder();
            var connectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            var connect = new SqlConnection(connectionString);

            try
            {
                logEventos.AppendLine(
                    "Tareas a Realizar: \n\n- Crear Tabla Estado \n- Adicion de Columna en Planificacion\n-Crear Relacion Estado - Planificacion\n\nResultado:");
                
                connect.Open();
                var command =
                    new SqlCommand("IF NOT EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Estado' ) " +
                                   " CREATE TABLE Estado ( " +
                                   "    IdEstado INT IDENTITY(1, 1) NOT NULL, " +
                                   "    NombreEstado VARCHAR(100) NOT NULL, " +
                                   "    CONSTRAINT PK_Estado PRIMARY KEY (IdEstado) ); ",
                        connect);
                command.ExecuteNonQuery();

                logEventos.AppendLine("\t- Crear Tabla Estado: Comando ejecutado correctamente");

                command.CommandText =
                    "IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'IdEstado' AND TABLE_NAME = 'Planificacion') " +
                    " ALTER TABLE Planificacion ADD IdEstado INT;";
                command.ExecuteNonQuery();

                logEventos.AppendLine("\t- Crear Columna IdEstado en Planificacion: Comando ejecutado correctamente");

                command.CommandText =
                    "IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_EstadoPlanificacion') " +
                    " ALTER TABLE Planificacion ADD CONSTRAINT FK_EstadoPlanificacion FOREIGN KEY (IdEstado) REFERENCES Estado (IdEstado); ";
                command.ExecuteNonQuery();

                logEventos.AppendLine("\t- Crear Relacion Estado - Planificacion: Comando ejecutado correctamente");

                command.CommandText =
                    "INSERT INTO Estado (NombreEstado) VALUES ('Trabaja'), ('Sin Flete'), ('No Trabaja');";
                command.ExecuteNonQuery();

                logEventos.AppendLine("\t- Datos Iniciales en Estado: Comando ejecutado correctamente");

                command.CommandText =
                    "IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'Tipo' AND TABLE_NAME = 'Unidad') " +
                    "ALTER TABLE Unidad ADD Tipo VARCHAR(100);";
                command.ExecuteNonQuery();
                
            }
            catch (Exception ex)
            {
                logEventos.AppendLine(ex.Message);
            }
            finally
            {
                Log.Text = logEventos.ToString();
            }
            /*
             
IF EXISTS ( SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Estado' )
BEGIN
	DROP TABLE Estado;
END
GO

CREATE TABLE Estado
(
	IdEstado INT IDENTITY(1, 1) NOT NULL,
	NombreEstado VARCHAR(100) NOT NULL
)
GO


ALTER TABLE Estado ADD CONSTRAINT PK_Estado FOREIGN KEY (IdEstado);
GO

ALTER TABLE Planificacion ADD IdEstado INT NULL;

ALTER TABLE Planificacion ADD CONSTRAINT FK_EstadoPlanificacion FOREIGN KEY (IdEstado) REFERENCES Estado (IdEstado);
GO

             */


        }
    }
}