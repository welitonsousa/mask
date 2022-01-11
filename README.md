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
 
## examples

```dart
// cpf validation
TextFormField(
  validator: Mask.validations.cpf,
  inputFormatters: [Mask.cpf()],
),

// your custom mask
TextFormField(
  validator: (value) => Mask.validations.generic(value, min:8, error: 'erro'),
  inputFormatters: [Mask.generic(masks: ['##-##-##'])],
)
```
