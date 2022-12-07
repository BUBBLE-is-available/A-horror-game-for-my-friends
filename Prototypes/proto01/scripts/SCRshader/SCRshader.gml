#macro ARE_SHADERS_SUPPORTED shaders_are_supported()

#macro LightRendererShader global.__lightRendererShader
LightRendererShader = {};
with(LightRendererShader) 
{
	index = SHAlightRenderer;
	
	uniformVariables = {};
	with(uniformVariables)
	{
		mouseUVCoordinates = shader_get_uniform(other.index, "mouseUVCoordinates");
		playerUVCoordinates = shader_get_uniform(other.index, "playerUVCoordinates");
		raysLengthsTexture = shader_get_uniform(other.index, "raysLengthsTexture");
	}
}


#macro RaysLengthsTracerShader global.__raysLengthsTracerShader
RaysLengthsTracerShader = {};
with(RaysLengthsTracerShader) 
{
	index = SHAraysLengthsTracer;
	
	uniformVariables = {};
	with(uniformVariables)
	{
		
	}
	
	
}

