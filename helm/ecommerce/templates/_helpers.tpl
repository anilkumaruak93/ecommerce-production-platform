{{- define "ecommerce.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "ecommerce.fullname" -}}
{{ printf "%s-%s" .Release.Name .Chart.Name }}
{{- end }}
