
using AS.Core.ValueObjects;

namespace AS.Core;

/// <summary>
/// CRUD i�lemleri yapan s�n�flar i�in aray�z
/// </summary>
/// <typeparam name="T"></typeparam>
public interface ICrudService<T>  where T : class, new()
{

    /// <summary>
    /// Filtreleme yaparak birden �ok sat�r i�eren liste modelini d�nd�r�r.
    /// </summary>
    /// <param name="filterModel">Filtreleme ��in S�n�f</param>
    /// <returns>T t�r�nden liste modeli</returns>
    Task<ListModel<T>> GetAll();

    /// <summary>
    /// ID parametresi alarak tek sat�r i�eren detay modelini d�nd�r�r.
    /// </summary>
    /// <param name="id">ID parametresi</param>
    /// <returns></returns>
    Task<T> GetById(Guid id);

    /// <summary>
    /// Ekleme i�lemini yaparak sonucu modelle d�nd�r�r.
    /// </summary>
    /// <param name="addModel"></param>
    /// <returns>Ekleme i�lemi sonucu olu�an model</returns>
    Task<T> Insert(T model);

    /// <summary>
    /// G�ncelleme i�lemini yaparak sonucu modelle d�nd�r�r.
    /// </summary>
    /// <param name="model"></param>
    /// <returns>G�ncelleme i�lemi sonucu olu�an model</returns>
    void Update(T model);

    /// <summary>
    /// ID parametresi alarak silme i�lemini yapar.
    /// </summary>
    /// <param name="id">ID parametresi</param>
    void Delete(Guid id);

}
