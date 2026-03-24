using lib_aplicaciones.Implementaciones;
using lib_aplicaciones.Interfaces;

namespace pruebas_unitarias;

[TestClass]
public class SedesUT
{
    [TestMethod]
    public void TestMethod1()
    {
        IConexion conexion = new Conexion();
        conexion.StringConexion = "server=localhost;integrated Security=True;TrustServerCertificate=true;database=db_parqueadero;";
        var lista_sedes = conexion.Sedes!.ToList();
    }
}
