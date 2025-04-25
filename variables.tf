variable "nombre_usuario" {
  description = "Nombre del usuario"
  type        = string

}

variable "aws_region" {
  description = "Región de AWS"
  type        = string  
}

variable "aws_profile" {
  description = "Perfil de AWS"
  type        = string
  default = "HyorchAdmin"
}