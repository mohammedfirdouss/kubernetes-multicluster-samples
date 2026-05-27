{{- define "helloworld.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "helloworld.labels" -}}
app.kubernetes.io/name: {{ include "helloworld.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end -}}

{{- define "helloworld.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helloworld.name" . }}
{{- end -}}
