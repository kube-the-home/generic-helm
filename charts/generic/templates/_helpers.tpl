{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "app.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Compute the default labels to be set on all resources
*/}}
{{- define "app.labels" -}}
{{- if .Values.labels -}}
{{- toYaml .Values.labels }}
{{- else -}}
app.kubernetes.io/name: {{ include "app.name" . }}
app.kubernetes.io/version: {{ .Values.image.tag }}
app.kubernetes.io/part-of: {{ include "app.name" . }}
{{- end -}}
{{- end }}
