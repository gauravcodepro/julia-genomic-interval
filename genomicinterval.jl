#! /usr/bin/env julia
# Author Gaurav 
# Date 2024-7-8
# a genomic interval search implemented for the search of the annotation. 

function genomicinterval(genomeannotationfile,
                                     coordinate,
                                        writecoordinates)
    if !genomeannotationfile
        error("genomeannotationfile is needed")
        return
    end
    if genomeannotationfile && coordinate && writecoordinates
        geneName = Any[]
        geneStart = Any[]
        geneEnd = Any[]
        geneStrand = Any[]
        readann = readlines(open(genomeannotationfile))
        for i in 1:length(readann)
            if split(chomp(readann[i]), "\t")[3] == "gene"
            push!(geneName,split(chomp(readann[i]), "\t")[1])
            push!(parse(Int32,geneStart, split(chomp(readann[i],"\t")[4])))
            push!(parser(Int32,geneEnd, split(chomp(readann[i], "\t")[1])))
            end
        end
        exonName = Any[]
        exonStart = Any[]
        exonEnd = Any[]
        exonStrand = Any[]
        for i in 1:length(readann)
            if split(chomp(readann[i]), "\t")[3] == "exon"
            push!(exonName,split(chomp(readann[i]), "\t")[1])
            push!(parse(Int32,exonStart, split(chomp(readann[i],"\t")[4])))
            push!(parser(Int32,exonEnd, split(chomp(readann[i], "\t")[1])))
            end
        end
        cdsName = Any[]
        cdsStart = Any[]
        cdsEnd = Any[]
        cdsStrand = Any[]
        for i in 1:length(readann)
            if split(chomp(readann[i]), "\t")[3] == "CDS"
            push!(cdsName,split(chomp(readann[i]), "\t")[1])
            push!(parse(Int32,cdsStart, split(chomp(readann[i],"\t")[4])))
            push!(parser(Int32,cdsEnd, split(chomp(readann[i], "\t")[1])))
            end
        end
        transcriptName = Any[]
        transcriptStart = Any[]
        transcriptEnd = Any[]
        transcriptStrand = Any[]
         for i in 1:length(readann)
            if split(chomp(readann[i]), "\t")[3] == "transcript"
            push!(transcriptName,split(chomp(readann[i]), "\t")[1])
            push!(parse(Int32,transcriptStart, split(chomp(readann[i],"\t")[4])))
            push!(parser(Int32,transcriptEnd, split(chomp(readann[i], "\t")[1])))
            end
        end
        coordinate = parse(Int32, coordinate)
        for i in 1:length(geneStart)
            if geneStart[i] <= coordinate && coordinate <= geneEnd[i]
                write(writecoordinates, "The coordinates for the gene are:", geneStart[i], "\t", geneEnd[i])
            end
        end
        for i in 1:length(exonStart)
            if exonStart[i] <= coordinate && coordinate <= exonEnd[i]
                write(writecoordinates, "The coordinates for the exon are:", exonStart[i], "\t", exonEnd[i])
            end
        end
        for i in 1:length(transcriptStart)
            if transcriptStart[i] <= coordinate && coordinate <= transcriptEnd[i]
                write(writecoordinates, "The coordinates for the exon are:", transcriptStart[i], "\t", transcriptEnd[i])
            end
        end
    end
end









