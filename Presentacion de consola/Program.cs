using lib_aplicaciones.Implementaciones;
using lib_aplicaciones.Interfaces;

Console.WriteLine("Conexion a base de datos");
IConexion conexion = new Conexion();
conexion.StringConexion = "server=localhost;integrated Security=True;TrustServerCertificate=true;database=db_parqueadero;";
var lista_sedes = conexion.Sedes!.ToList();
var lista_cargos = conexion.Cargos!.ToList();
var lista_tarifas = conexion.Tarifas!.ToList();

foreach (var s in lista_sedes)
{
    Console.WriteLine($"{s.Id} - {s.Nombre}  ");
}

Console.WriteLine("----------------------------------");

foreach (var c in lista_cargos)
{
    Console.WriteLine($"{c.Id} - {c.Nombre}  ");
}

Console.WriteLine("----------------------------------");

foreach (var t in lista_tarifas)
{
    Console.WriteLine($"{t.Id} - {t.TipoVehiculo} {t.PrecioHora}  ");
}


Console.WriteLine("Final");


