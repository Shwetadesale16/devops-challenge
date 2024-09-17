{{- define "getbird.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{- define "getbird.fullname" -}}
{{- printf "%s-%s" (include "getbird.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "getbird.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "getbird.selectorLabels" . }}
{{- end -}}

{{- define "getbird.selectorLabels" -}}
app: {{ include "getbird.name" . }}
{{- end -}}

