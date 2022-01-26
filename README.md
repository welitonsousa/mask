# Mask

## - validations

 - Mask.validation.cpf
 - Mask.validation.cnpj
 - Mask.validation.cpfOrCnpj
 - Mask.validation.email
 - Mask.validation.money
 - Mask.validation.date
 - Mask.validation.money
 - Mask.validation.phone
 - Mask.validation.generic
 
## - Description
Validations are for you to be able to simply validate your field


## - Masks

 - Mask.creditCard
 - Mask.cpf
 - Mask.cnpj
 - Mask.cpfOrCnpj
 - Mask.money
 - Mask.date
 - Mask.phone
 - Mask.generic
 
## - Description
The masks are for you to be able to customize your field, according to that information


## - Examples

```dart
// money mask and validation
TextFormField(
  autovalidateMode: AutovalidateMode.onUserInteraction,
  validator: (value) => Mask.validations.money(
    value, 
    min: 100.0, // optional field
  ),
  inputFormatters: [Mask.money()],
),

// cpf or cnpj mask and validation
TextFormField(
  validator: Mask.validations.cpfOrCnpj,
  inputFormatters: [Mask.cpfOrCnpj()],
),

// your custom mask and validation
TextFormField(
  validator: (value) => Mask.validations.generic(value, min:8, error: 'info erro'),
  inputFormatters: [
    Mask.generic(
      masks: ['##-##-##'], 
      hashtag: Hashtag.numbers, // optional field
    ),
  ),
)
```
