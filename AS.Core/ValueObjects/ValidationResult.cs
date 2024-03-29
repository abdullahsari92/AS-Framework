namespace AS.Core.ValueObjects;

/// <summary>
/// Doğrulama sonucunu 
/// </summary>
public class ValidationResult
{

    public ValidationResult(string propertyName, string errorMessage)
    {
        PropertyName = propertyName;
        ErrorMessage = errorMessage;
    }

    /// <summary>
    /// Doğrulanamayan özellik
    /// </summary>
    public string PropertyName { get; set; }

    /// <summary>
    /// Doğrulama hata iletisi
    /// </summary>
    public string ErrorMessage { get; set; }

}
