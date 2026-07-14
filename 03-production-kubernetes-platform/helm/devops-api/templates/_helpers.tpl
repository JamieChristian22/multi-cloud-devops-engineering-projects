{{- define "devops-api.fullname" -}}{{ printf "%s-devops-api" .Release.Name | trunc 63 | trimSuffix "-" }}{{- end }}
{{- define "devops-api.selector" -}}app.kubernetes.io/name: devops-api
app.kubernetes.io/instance: {{ .Release.Name }}{{- end }}
