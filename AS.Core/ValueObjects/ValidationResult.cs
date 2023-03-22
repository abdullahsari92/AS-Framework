namespace AS.Core.ValueObjects;

/// <summary>
/// Do�rulama sonucunu 
/// </summary>
public class ValidationResult
{

    public ValidationResult(string propertyName, string errorMessage)
    {
        PropertyName = propertyName;
        ErrorMessage = errorMessage;
    }

    /// <summary>
    /// Do�rulanamayan �zellik
    /// </summary>
    public string PropertyName { get; set; }

    /// <summary>
    /// Do�rulama hata iletisi
    /// </summary>
    public string ErrorMessage { get; set; }

}
