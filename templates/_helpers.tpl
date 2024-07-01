{{/*
Expand the name of the chart.
*/}}
{{- define "fleetman.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fleetman.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "fleetman.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "fleetman.labels" -}}
helm.sh/chart: {{ include "fleetman.chart" . }}
{{ include "fleetman.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "fleetman.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fleetman.name" . }}-queue
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "fleetman.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "fleetman.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

#fleetman-position-simulator
{{- define "fleetman.simulator.labels" -}}
helm.sh/chart: {{ include "fleetman.chart" . }}
{{ include "fleetman.simulator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "fleetman.simulator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fleetman.name" . }}-simulator
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

#fleetman-position-tracker
{{- define "fleetman.tracker.labels" -}}
helm.sh/chart: {{ include "fleetman.chart" . }}
{{ include "fleetman.tracker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "fleetman.tracker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fleetman.name" . }}-position-tracker
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

#fleetman-api-gateway
{{- define "fleetman.api.labels" -}}
helm.sh/chart: {{ include "fleetman.chart" . }}
{{ include "fleetman.api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "fleetman.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fleetman.name" . }}-api-gateway
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

#fleetman-web-angular
{{- define "fleetman.web.labels" -}}
helm.sh/chart: {{ include "fleetman.chart" . }}
{{ include "fleetman.web.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "fleetman.web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fleetman.name" . }}-web-angular
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}