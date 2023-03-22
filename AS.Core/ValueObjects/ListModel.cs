namespace AS.Core.ValueObjects;

// <summary>
/// Detay i�lemlerinde kullan�lacak jenerik s�n�f
/// </summary>
public class ListModel<T> where T : class, new()
{

    public Paging Paging { get; set; }

    public List<T>? Items { get; set; }

}
